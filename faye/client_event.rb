# -*- encoding : utf-8 -*-
class ClientEvent
  MONITORED_CHANNELS = [ '/meta/subscribe', '/meta/disconnect' ]

  def incoming(message, callback)
    puts message.inspect
    
    return callback.call(message) unless MONITORED_CHANNELS.include? message['channel']

    faye_msg = Hashie::Mash.new(message)
    faye_action = faye_msg.channel.split('/').last
    name = if faye_action == "subscribe"
      push_client(faye_msg.clientId,faye_msg.person_nick_name)
    elsif faye_action == "disconnect"
      pop_client(faye_msg.clientId)
    end
    if name 
      faye_client.publish('/discussions/new', build_hash(name, faye_action))
    end
    callback.call(message)
  end

  def connected_clients
    @connected_clients ||= { }
  end

  def push_client(client_id,person_nick_name)
    connected_clients[client_id] = person_nick_name
  end

  def pop_client(client_id)
    connected_clients.delete(client_id)
  end

  def faye_client
    @faye_client ||= Faye::Client.new('http://localhost:9292/faye')
  end

  def build_hash(name, action)
    message_hash = {}
    if action == 'subscribe'
      message_hash['message'] = { 'content' => "#{name} 进入聊天室", 'people_list' => connected_clients.values.uniq}      
    elsif action == 'disconnect'
      message_hash['message'] = { 'content' => "#{name} 离开聊天室", 'people_list' => connected_clients.values.uniq }
    end
    message_hash
  end
end

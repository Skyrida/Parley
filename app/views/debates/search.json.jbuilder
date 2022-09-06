if @my_chat
  json.chat chatroom_path(@my_chat)
else
  json.chat nil
end
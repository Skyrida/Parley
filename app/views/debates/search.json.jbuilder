if @my_chat
  json.chat chatroom_path(@chatroom)
else
  json.chat nil
end
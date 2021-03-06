get '/question/new' do
  erb :'questions/new_question'
end

post '/question' do
  params[:question][:user_id] = current_user.id
  question = Question.new(params[:question])
  if question.save
    redirect '/'
  else
    #display error
    redirect '/question/new'
  end
end

get '/question/:id' do |id|
  question = Question.find(id)
  erb :'questions/single_question', locals: {question: question}
end
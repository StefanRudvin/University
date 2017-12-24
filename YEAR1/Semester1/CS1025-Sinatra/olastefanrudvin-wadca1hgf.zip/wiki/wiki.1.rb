puts "This is process #{Process.pid}"
require 'sinatra'
require 'data_mapper'
DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/wiki.db")
class User
    include DataMapper::Resource
    property :id,Serial
    property :username, Text, :required => true
    property :password, Text, :required => true
    property :date_joined, DateTime
    property :edit, Boolean, :required => true, :default => false
end

# Code to start: ruby wiki.rb -p $PORT -o $IP
# To find process: lsof -i tcp:8080
# To kill process: kill -9 <PID>

DataMapper.finalize.auto_upgrade!

$myinfo = " "
@info = ""


def readFile(filename)
    info = ""
    file = File.open(filename)
    file.each do |line|
        info = info + line
    end
    file.close
    $myinfo = info
end

get '/' do
    info = "This wiki was created by"
    len = info.length
    len1 = len
    readFile("wiki.txt")
    @info = info + " " + $myinfo
    len= @info.length
    len2 = len - 1
    len3 = len2 - len1
    @words=len3.to_s
    
    erb :home
end

get '/about' do
    erb :about
end

#Feedback option

get '/email' do
    info = ""
    file = File.open("email.txt")
    file.each do |line|
        info = info + line
    end
    file.close
    info = simple_format(info)
    @info = info
    
    erb:email
end

get '/email' do
    info = "#{params[:message]}"
    @info = info
    file = File.open("email.txt", "a")
    file << "\n"
    file << "This message was sent at: "
    file << Time.now
    file << "\n"
    file << "By username: "
    file << $credentials[0]
    file << "\n"
    file << @info
    file << "\n"
    file << "\n"
    file.close
    redirect '/thanks'
end


get '/create' do
    erb :create
end

get '/edit' do
    protected!
    info = ""
    file = File.open("wiki.txt")
    file.each do |line|
            info = info + line
    end
    file.close
    @info = info
    
    erb :edit
end

#edit function

put '/edit' do
    protected!
            info = "#{params[:message]}"
            @info = info
            file = File.open("wiki.txt", "w")
            file.puts @info
            file.close
            redirect '/'
end


# Log function that shows the log files for each article (Admin only)

get '/log' do
    protected!
    info = ""
    file = File.open("dunottarlog.txt")
    file.each do |line|
        info = info + line
    end
    file.close
    @info = info
    erb:log
    
end

#Reset function

get '/reset' do
    file = File.open("dunottarreset.txt", "rb")
    contents = file.read
    file.close
    file = File.open("dunottar.txt", "w")
    file.puts contents
    file.close
    erb:reset
end

# reset log

get '/resetlog' do
    file = File.open("log.txt", "w")
    file.puts "This is the log "
    file.close
    erb:reset
end

# Reset extended log

get '/resetlong' do
    file = File.open("long.txt", "w")
    file.puts "This is the extended log "
    file.close
    erb:reset
end



#Log function with full changes to article

get '/loglong' do
    protected!
    info = ""
    file = File.open("long.txt")
    file.each do |line|
        info = info + line
    end
    file.close
    @info = info
    erb:loglong
    
end

get '/archive' do
    file = File.open("dunottar.txt", "rb")
    contents = file.read
    file.close
    file = File.open("archive.txt", "a")
    file << "\n"
    file << "This backup was created on: "
    file << Time.now
    file << "\n"
    file << "By: "
    file << $credentials[0]
    file << "\n"
    file << contents
    file << "\n"
    file << "\n"
    file.close
    redirect '/archiveerb'
end

get '/dunottar' do
    info = ""
    readFile("dunottar.txt")
    @info = $myinfo
    len = @info.length
    @characters = len.to_s
    
    @words = @info.split.size
    
    erb:dunottar

end

get '/archiveerb' do
    protected!
    info = ""
    file = File.open("archive.txt")
    file.each do |line|
        info = info + line
    end
    file.close
    @info = info
    erb:archiveerb
    
end

get '/dunottaredit' do
    protected!
    info = ""
    file = File.open("dunottar.txt")
    file.each do |line|
        info = info + line
    end
    file.close
    info = simple_format(info)
    @info = info
    
    erb:dunottaredit
end

# simple_format to add line breaks and paragraphs into text.

def simple_format(text)
      text.gsub!(/ +/, " ")
      text.gsub!(/\r\n?/, "\n")
      text.gsub!(/\n/, "<br />\n")
      text
end

put '/dunottaredit' do
    protected!
            info = "#{params[:message]}"
            simple_format(info)
            @info = info
            file = File.open("dunottar.txt", "w")
            file.puts @info
            file.close
            file = File.open("dunottarlog.txt", "a")
            file << "\n"
            file << "\n"
            file << "Edited by: "
            file << $credentials[0]
            file << "\n"
            file << "Time: "
            file << Time.now
            file << "\n"
            file.close
            
            file = File.open("long.txt", "a")
            file << "\n"
            file << @info
            file << "\n"
            file << "Edited by: "
            file << $credentials[0]
            file << "\n"
            file << "Time: "
            file << Time.now
            file << "\n"
            file.close
            redirect '/dunottar'
end

get '/login'do
    erb :login
end

post '/login' do
    $credentials = [params[:username],params[:password]]
    @Users = User.first(:username => $credentials[0])
    if @Users
        if @Users.password == $credentials[1]
            redirect '/'
        else
            $credentials = ['','']
            redirect'/worngaccount'
        end
    else
        $credentials =['','']
        redirect'/wrongaccount'
    end
end

get '/wrongaccount'do
    erb :wrongaccount
end

get '/user/:uzer' do
    @Userz = User.first(:username => params[:uzer])
    if @Userz != nil
        erb:profile
    else
        redirect '/noaccount'
    end
end

get '/createaccount'do
    erb :createaccount
end

#Createaccount, username password and datejoined

post '/createaccount' do
    n = User.new
    n.username = params[:username]
    n.password = params[:password]
    n.date_joined = Time.now
    if n.username == "Admin" and n.password == "Password"
        n.edit = true
    end
    n.save
    redirect'/'
end

#implement logout function & view

get '/logout' do
    $credentials = ['','']
    redirect '/'
end

#Change if user can edit articles.

put '/user/:uzer' do
    n = User.first(:username => params[:uzer])
    n.edit = params[:edit] ? 1 : 0
    n.save
    redirect '/admincontrols'
end

#get admincontrols view

get 'admincontrols' do
    @list2 = User.all :order => :id.desc
    erb :admincontrols
end

#Allows admin to delete users

get '/user/delete/:uzer' do
    protected!
    n = User.first(:username => params[:uzer])
    if n.username == "Admin"
        erb :denied
    else
        n.destroy
        @list2 = User.all :order => :id.desc
        erb :admincontrols
    end
end

get'/notfound' do
    erb :notfound  # calls notfound view
end

get'/noaccount' do
    erb :noaccount # calls noaccount view
end

get'/denied' do
    erb :denied # calls denied view
end

not_found do
    status 404
    redirect '/notfound'
end

helpers do
    def protected!
        if authorized?
            return
        end
        redirect '/denied'
    end
    
    def authorized?
        if $credentials != nil
            @Userz = User.first(:username => $credentials[0])
            if @Userz
                if @Userz.edit == true
                    return true
                else
                    return false
                end
            else
                return false
            end
        end
    end
end

get'/admincontrols' do
    protected!
    @list2 = User.all :order => :id.desc
    erb :admincontrols
end


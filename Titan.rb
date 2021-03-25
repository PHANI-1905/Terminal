require 'FileUtils'
require 'clipboard'
require 'time'








print ("

Name: TITAN
Version: 1.0.0
Function: Terminal







  _ _ _ _ _ _    _ _ _ _ _  _ _ _ _ _ _            ^                   ^               ''
       :             ;           @              ''   ''              ''  ''          ''
       :             ;           @            ''      ''           ''     ''       ''
       |             |           |          '' = = = = ''        ''        ''     ''
       ''            /           !        ''            ''     ''           ''  ''
      _/_         _ _?_ _       _$_      ''               ''  ''              ''_



                                    ****Written in Ruby****
                                    ****By Naga Phanindra****



NOTE:
`````The commands are nearly equal to linux.`````
`````Try 'Help' to view the commands`````
")

while TRUE

  print "$Titan##{$ccc}> "
  answer = gets.chomp()

  case answer

  when "Help"
    puts "cd => change directory.\nls => shows all file in a directory(use this after cd command).\npwd => present working directory.\nmkdir => makes new directory.\nrmdir => removes a directory(if it is empty).\nrm => removes files.\nmv => moves a file.\nopen => opens a file.\nwrite => creates a file and can write in it.\nhistory => prints the history.\ncp => copies the path of cd\nnerdy => calculator.\nblock => blocks a web site for your computer."

  when "cd"
    begin
    print "File path: "
    $ccc = gets.chomp()
    x = Dir::chdir($ccc)
    puts "$Tiger##"+x.to_s
    rescue Errno::ENOENT
      puts "No such file or directory"
    end


  when "ls"
    begin
    x = Dir::entries($ccc)
    puts x
    rescue Errno::ENOENT, TypeError
        puts "1) If you enter the wrong file or directory in cd command ls dosn't work\n2) Please use cd command first"
    end


  when "pwd"
    x = Dir::pwd
    puts x

  when "mkdir"
    begin
    print "File path: "
    file_name = gets.chomp()
    x = Dir::mkdir(file_name)
    puts x.to_s
    rescue Errno::EEXIST
      puts "File exists"
    end

  when "rmdir"
    print "File path: "
    file_path = gets.chomp()
    x = Dir::rmdir(file_path)
    puts x.to_s

  when "exit"
    puts "Bye...Bye....."
    exit 0


  when "write"
    begin
    print "File path: "
    name = gets.chomp()
    puts "Write: "
    writes = gets.chomp()
    File.open(name, "a") do |file|
      file.write("\n"+writes)
    end
   rescue Errno::EISDIR
     puts "Is a directory"
   end

  when "open"
    begin
    print "File path: "
    path = gets.chomp()
    File.open(path,"r") do |read|
      puts read.read()
    end
    rescue Errno::EISDIR
      puts "Is a directory"
    end

  when "rm"
    print "File path: "
    name_rm = gets.chomp()
    File.delete(name_rm) if File.exist?(name_rm)

  when "rm files"
    print "File path: "
    name_f = gets.chomp()
    FileUtils.remove_dir(name_f) if File.directory?(name_f)

  when "mv"
    print "Moving file path: "
    m_file = gets.chomp()
    print "Where to move: "
    m_path = gets.chomp()
    FileUtils.mv(m_file , m_path)

  when "history"
    puts $ccc
    puts file_name
    puts file_path
    puts name
    puts path
    puts name_rm
    puts name_f
    puts m_file
  when "cp"
    Clipboard.copy($ccc)
    puts Clipboard.paste
  when "owner"
    puts "TITAN is woned by Naga Phanindra."
  when "version"
    puts "1.0.0"
  when "time"
    puts Time.now()
  end
end

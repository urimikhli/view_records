
ruby version: ruby 2.0.0p247 (2013-06-27 revision 41674) [universal.x86_64-darwin13]
rspec version 3.0.3

In the directory where all the files are you should run the following

$> ruby view_records.rb pipe.txt space.txt comma.txt
The records are printed to STDOUT. Redirect to a file in order to persist

To get specific sorts call DataRecordList.output_records(<sort by>)
e.g.: puts recordList.output_records("lastname")

The available sort by's are:

"gender" -- gender then last name asc
"birthdate" -- Birthdate (oldest first) then lastname
"lastname" -- lastname asc

see view_records.rb for example of how to print out a record

Manifest:

README.txt *this file
comma.txt
pipe.txt
space.txt
view_records.rb
data_record.rb
data_record_list.rb
spec/data_record_list_spec.rb
spec/data_record_spec.rb


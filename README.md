# PGEnhanced
[ ![Codeship Status for Hireology/dw_client](https://codeship.com/projects/7ae436c0-0313-0133-32e9-36fe44f74615/status?branch=master)](https://codeship.com/projects/89109)

### About
PGEnhanced is a gem that provides a facility to connect to a PostgreSQL database (using the popular [pg gem](https://bitbucket.org/ged/ruby-pg/wiki/Home)),
in order to provide a simple query interface through a PGEnhanced::Client object. The PGEnhanced::Client object defines convenience methods such as
`execute` and `execute_json` that both allow the execution of arbitrary sql queries whose results are returned either as a PG::Result object, or as a
JSON collection whose elements represent each record returned from the query, respectively. Additional functionality for generating a CSV representation
of a query result will also be possible with `execute_csv`.

### Configuration

```ruby
# PGEnhanced accepts a hash of connection parameters defined as:

connection_parameters = {
  :host => 'localhost', # if no host is specified, :host defaults to 'localhost'
  :port => 5432, # if no port is specified, :port defaults to the postgresql default of 5432
  :database => 'example_db',
  :username => 'example_user',
  :password => 'secret'
}

# Given a hash of connection parameters, PGEnhanced creates a postgres database connection
# and instantiates a client object like so:

client = PGEnhanced::Client.establish_connection(connection_options)
```

If you are using PGEnhanced within a Rails context, you can take advantage of Rails' database yaml files like so:

```ruby
connection_parameters = YAML.load(ERB.new(File.read("config/database.yml")).result)[ENV['RAILS_ENV'] || 'development']

PGEnhanced::Client.establish_connection(connection_parameters)
```

### Usage

```ruby
# Executing an arbitrary sql query:
client = PGEnhanced::Client.establish_connection(connection_options)

result = client.execute("select * from example_table")
result # => #<PG::Result:0x007ffb07d2e3a8 @connection=#<PG::Connection:0x007ffb07b64478 @socket_io=nil, @notice_receiver=nil, @notice_processor=nil>>
result.count # => 1
result.first # => {"count"=>"8165"}
result.first["count"] # => "8165"
```

```ruby
# Executing an arbitrary sql query returned as JSON:
client = PGEnhanced::Client.establish_connection(connection_options)

result = client.execute_json("select * from example_table")
result # => "[{\"count\":8165}]"
JSON.parse(result) # => [{"count"=>8165}]
```

### Features

1. CSV generation from queries

### License
The MIT License (MIT)

Copyright (c) 2015 Hireology, Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

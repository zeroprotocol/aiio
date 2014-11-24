// aiio v0.0.1 
// a minimalistic full-stack CMS
// https://www.zeroprotocol.net/aiio
// Author: Ryan Marin (rmarin@zeroprotocol.net)


Copyright (c) 2014 Ryan Marin

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Directory Structure

/certs				look at config.ru to change the default certificate location
/plugins                        plugins/<plugin name>/plug.rb  (bootstrap for hooks, db engines, and event responses)
/templates                      templates/<template name>/index.html (template wrapper for CMS)
/webroot                        home of public webroot and 'js/'
/xml				installation files

Installation Instructions

Step 1)

#!/usr/bin/bash
sudo apt-get update
sudo apt-get install sqlite3 libsqlite3-dev ruby ruby-dev
git clone 'https://github.com/zeroprotocol/aiio.git'
cd aiio/certs
openssl genrsa -des3 -out server.key 1024
openssl req -new -key server.key -out server.csr
cp server.key server.key.org
openssl rsa -in server.key.org -out server.key
openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt
cd ..
bundle
sudo ruby config.ru

Step 2) Open https://localhost in the browser of your choice and follow installation instructions

For all other configurations be sure to consult config.ru before starting aiio. Remove 'aiio/LOCKFILE' to reinstall aiio upon next boot. If you accidentially
removed the LOCKFILE and you really don't want to reinstall: echo 1 >> LOCKFILE



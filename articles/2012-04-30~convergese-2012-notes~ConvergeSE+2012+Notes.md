I attended this year's ConvergeSE in Columbia, SC. I took copious notes on the sessions I attended.


## Friday

### Intro: Map for Awesomeness
Passion > Purpose > Promise

### Session 1: Node.js ([Tom Wilson](http://jackrussellsoftware.com/))

#### What is it?
* [nodejs.org](http://nodejs.org/)
* JS on the server
* Single threaded - event I/O (non-locking - can run other things while reading file/db)

#### Three Conventions
* Callbacks (function as param)
  * every synch call takes a callback - first param is error, second is result, third is body?
* EventEmitter
  * require events, and emit events (.emit())
  * can create loosely couple
  * emitter.on( , )
  * emitter.emit()
* Streams ([maxogden.com/node-streams](http://maxogden.com/node-streams))
  * what's passed in a stream is a buffer
  * piping between tcp, file, db, etc
  * can chain pipes (web form -> code that modifies -> db)
  * one-line http server

#### Use Case 1: Twitter Stream API
* Code: [gist.github.com/2503844](https://gist.github.com/2503844])
* package.json is like Gemfile
* The --save shell param adds it to package.json
* index.js is the starting file
* Has native DB drivers, so there’s no blocking anywhere in the process

#### Use Case 2: Request - cURL in Node ([http://github.com/mikeal/request](http://github.com/mikeal/request))
* Code: [gist.github.com/2509697](https://gist.github.com/2509697)
* Easy to use
* Supports streams
* Supports JSON
* Stream any response to a file stream

#### Use Case 3: Express ([expressjs.com](http://expressjs.com/))
* MVC for Node
* Template langs: Jade, Moustache, Hogan, EJS
* Super lightweight!

#### Middleware
* [github.com/senchalabs/connect](https://github.com/senchalabs/connect)
* be careful with middleware, because some of it blocks!
* try to avoid middleware altogether

#### Other interesting js libs:
1. [http://socket.io/](http://socket.io/)
2. [http://meteor.com/](http://meteor.com/)
3. [http://derbyjs.com/](http://derbyjs.com/)
4. [http://visionmedia.github.com/mocha/](http://visionmedia.github.com/mocha/)
5. [https://github.com/caolan/async](https://github.com/caolan/async)
6. [http://usebam.com](http://usebam.com)
7. [http://browserquest.mozilla.org](http://browserquest.mozilla.org)
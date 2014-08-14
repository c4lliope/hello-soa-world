# Hello, SOA World!

This is the project I used for the live-coding demonstration in my talk,
"Hello, SOA World!" at Eurucamp 2014.

Many thanks to @tehviking for his [Giffindor](https://github.com/tehviking/giffindor)
app, which I used as a base app to extract a service from.

## Run the apps

### Giffindor

```bash
cd giffindor
bundle install
bundle exec rails server
```

### Lumberyard Server

```bash
cd lumberyard
bundle install
ruby lumberyard.rb
```

### Lumberyard Listener

```bash
cd lumberyard
ruby receive.rb
```


If you have any questions about the code or contents of the talk, just open an
issue and I'll be happy to chat!

Cheers,  
-Grayson

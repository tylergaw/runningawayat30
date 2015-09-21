# [Running Away at 30](http://runningawayat30.com)

Hey, Tyler if this is the first time you're building the site, make sure you run
`make build`. You just want to make sure Jekyll has created the `public` dir before the css is compiled cause directories. Love you.

### Working

Like most build processes, this one is a house of cards even for its small size. Do this

Open one Terminal pane and run:

```
make watch-css
```

to recompile your css with `node-sass` then `postcss` when ya change it.

In another Terminal pane run:

```
jekyll serve
```

That'll run yre server. It'll also rebuild the site when you change things, including the scss.

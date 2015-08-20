# meshblu-http-proxy-example
Meshblu HTTP Proxy example. No Auth, no magic, just proxying

### To setup:

```shell
npm install
npm install -g meshblu-util
meshblu-util register --open > meshblu.json
```

*Note: Creating an open device like this is not recommended for production use. In production, you would want to lock down the permissions to only those devices that should be allowed to message your device.*

### To run:

`<REQUEST_BIN_URL>` is a url obtained from http://requestb.in/.
Go there, obtain a url that looks like `http://requestb.in/1i72tu01`
and use that as the `<REQUEST_BIN_URL>`. Then use the inspect
variant to see the proxied HTTP requests: 
`http://requestb.in/1i72tu01?inspect`

```shell
REQUEST_BIN_URL=<REQUEST_BIN_URL> npm start
```

This project uses `debug`, so to get more information, try these variants with increasing levels of information:

```shell
DEBUG=meshblu-http-proxy-example npm start
DEBUG=meshblu* npm start
DEBUG=* npm start
```

With a partner, develop a server program that responds to the following messages:

Client connects:
```bash
nc IP PORT
```
1. Hello
  * Client says: `hello`
  * Server responds: `HELLO!`

2. Echo
  * Client says: `echo word`
  * Server responds: `You said word`
  * Client says: `echo another_word`
  * Server responds: `You said another_word`

3. Ping Pong
  * Client says: `ping`
  * Server says: `pong`

4. Guess the number
  * Client says: `guess`
  * Server says: `guess a number between 1 and 10`
  * Client says: `5`
  * Server says: if right - `correct!`, if wrong - `wrong!`

5. Come up with your own protocol!
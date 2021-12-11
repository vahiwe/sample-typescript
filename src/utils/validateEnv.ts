import { cleanEnv, port, str } from 'envalid';
import Rollbar from 'rollbar';
import config from 'config';

const validateEnv = () => {
  const rollbar = new Rollbar({
    accessToken: config.get('rollbarToken'),
    captureUncaught: true,
    captureUnhandledRejections: true,
  })
  // record a generic message and send it to Rollbar
  rollbar.log('Hello world!')
  console.log("message sent")

  cleanEnv(process.env, {
    NODE_ENV: str(),
    PORT: port(),
  });
};

export default validateEnv;

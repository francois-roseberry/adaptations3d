# Static website for adaptations3d.ca

## Local development

### Prerequisites

Install node and yarn

### Installing dependencies

Run `yarn`

### Compiling the translations and generating the website

Run `yarn build`. All required files will be copied under `public/`

### Running

Run `yarn start`. It runs a simple Node script which uses `express` to serve the static files in `public/`

## Deployment

Launch the `Deploy site` github action to deploy to Github Pages
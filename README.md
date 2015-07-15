# Personality Insights Java Starter Application

  The IBM Watson [Personality Insights][service_url] service uses linguistic analysis to extract cognitive and social characteristics from input text such as email, text messages, tweets, forum posts, and more. By deriving cognitive and social preferences, the service helps users to understand, connect to, and communicate with other people on a more personalized level.

Give it a try! Click the button below to fork into IBM DevOps Services and deploy your own copy of this application on Bluemix.

[![Deploy to Bluemix](https://bluemix.net/deploy/button.png)](https://bluemix.net/deploy?repository=https://github.com/watson-developer-cloud/personality-insights-java)

## Getting Started

1. Create a Bluemix Account

   [Sign up][sign_up] in Bluemix or use an existing account. Watson Services
   in Beta are free to use.

2. Download and install the [Cloud-foundry CLI][cloud_foundry] tool.

3. Edit the `manifest.yml` file and change the `<application-name>` to something unique.

  ```none
  applications:
  - services:
    - personality-insights-service-standard
    name: <application-name>
    path: output/webApp.war
    memory: 512M
  ```

  The name you use determines your initial application URL, e.g.,
  `<application-name>.mybluemix.net`.

4. Connect to Bluemix in the command line tool.

  ```sh
  $ cf api https://api.ng.bluemix.net
  $ cf login -u <your-user-ID>
  ```

5. Create the Personality Insights service in Bluemix.

  ```sh
  $ cf create-service personality_insights standard personality-insights-service-standard
  ```

6. Download and install the [ant][ant] compiler.

7. Build the project.

   You need to use the Apache `ant` compiler to build the Java application.
   For information about the `ant` compiler and to download a copy for your
   operating system, visit ant.apache.org.

  ```sh
  $ ant
  ```

8. Push it live!
  ```sh
  $ cf push
  ```

   See the full [Getting Started][getting_started] documentation for more
   details, including code snippets and references.

## Running locally

  The application uses the WebSphere Liberty profile runtime as its server,
  so you need to download and install the profile as part of the steps below.

1. Copy the credentials from your `personality-insights-service-standard` service in Bluemix to
   `DemoServlet.java`. You can use the following command to see the
   credentials:

    ```sh
    $ cf env <application-name>
    ```

   Example output:

    ```sh
    System-Provided:
    {
    "VCAP_SERVICES": {
      "personality-insights": [{
          "credentials": {
            "url": "<url>",
            "password": "<password>",
            "username": "<username>"
          },
        "label": "personality-insights",
        "name": "personality-insights-service-standard",
        "plan": "IBM Watson Personality Insights Monthly Plan"
     }]
    }
    }
    ```

		You need to copy the `username`, `password`, and `url`.

2. Install the [Liberty profile runtime][liberty] (for Mac OSX, check this
   [guide][liberty_mac]).

3. Create a Liberty profile server in Eclipse.

4. Add the application to the server.

5. Start the server.

6. Go to `http://localhost:9080/app/` to see the running application.

## i18n Support

  The application has i18n support and is available in English and 
  Spanish. The language is automatically selected from the browser's
  locale.
  
  To add a new translation follow the steps below:
  
  1. Translating the static text:
  	1. Locate the `messages.properties` file present in the 
  	   `src/com/ibm/cloudoe/samples/i18n` directory. This file
           includes all the messages and labels in English.
  	1. Copy `messages.properties` and name the new file with the 
  	   format `messages_ll_CC.properties` or `messages_ll.properties`, 
           where `ll` is the language code and `CC` is the country code. For 
           example, a new translation for argentinian Spanish would be named 
           after `messages_es_AR.properties`. You may omit the country code 
           to make the translation global for the language.
	1. Translate each English string to the desired language and save it.
  1. Translating the personality summary:
  	1. Locate the JSON files present in `WebContent/json/` directory.
  	   These are:
	     * `facets.json`
	     * `needs.json`
	     * `summary.json`
	     * `traits.json`
	     * `values.json`
	1. Copy each file and name it with the format `<filename>_ll-CC.json`
	   or `<filename>_ll-CC.json`. For example, a Portuguese language
           translations for `facets.json` will result in a new file named 
           `facets_pt.json`, an UK English translation for `traits.json` will
           result in a new file named `traits_en-UK.json`.
	1. Translate all the strings present in the new files to the desired
	   language and save them.
  

## Troubleshooting

  To troubleshoot your Bluemix application, the most useful source of
  information is the log files. To see them, run the following command:

  ```sh
  $ cf logs <application-name> --recent
  ```

## License

  This sample code is licensed under Apache 2.0. Full license text is available in [LICENSE](LICENSE).  
  This sample code is using jQuery and d3, both are using MIT license

## Contributing

  See [CONTRIBUTING](CONTRIBUTING.md).

## Open Source @ IBM

  Find more open source projects on the
  [IBM Github Page](http://ibm.github.io/).

[service_url]: http://www.ibm.com/smarterplanet/us/en/ibmwatson/developercloud/personality-insights.html
[cloud_foundry]: https://github.com/cloudfoundry/cli
[getting_started]: http://www.ibm.com/smarterplanet/us/en/ibmwatson/developercloud/doc/getting_started/
[sign_up]: https://apps.admin.ibmcloud.com/manage/trial/bluemix.html?cm_mmc=WatsonDeveloperCloud-_-LandingSiteGetStarted-_-x-_-CreateAnAccountOnBluemixCLI
[liberty]: https://developer.ibm.com/wasdev/downloads/
[liberty_mac]: http://www.stormacq.com/how-to-install-websphere-8-5-liberty-profile-on-mac/
[ant]: http://ant.apache.org/bindownload.cgi

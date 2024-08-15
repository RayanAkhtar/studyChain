# StudyChain
A website development project using HTML, CSS and Javascript to allow students to study content quicker.
This is achieved through pointing out the prerequisites that a student needs to know before learning a topic.

## Tech Stack Used

### Languages

`Html` - Display content on the website
`Css` - Styles content on the website
`Javascript` - Allows interaction on the website

### Frameworks

`neo4j` - A backend used to store the graph that will be displayed to the user
`D3` - A frontend used to display the graph to the user on the website.

`Firebase` - Used to store user data, also to provide a means of authentication.

`React` - The backbone of the website, everything is designed as a React component.

## How to set up the Tech Stack

First create a react app by following the link `https://vitejs.dev/guide/`.
Vite is used for performance purposes, though you could just use `npx create-react-app [app name here]` instead.
Then go into the app folder and run `git init` to create a git repository.
Then use `npm` to install the relevant frameworks mentioned above.
Then, locate `src/App.jsx`, this (alongside `src/App.css`) should be edited to now meet up your purposes. 
<br>

Now, you may wish to have routing in your website, this can be one using the routers provided with react.
Check out the `Router` component in `src/App.jsx` to see how the router was setup.
If you want to see a use case, check out the `Link` components present in components such as Navbar.
Another use case can be seen in `TopicAdderForm.jsx` with `window.location.assign(newpath)`
<br>

To setup the backend databases `neo4j` and `firebase`, you will need to setup API keys, check out their website on how to set it up.
To host the website, I used heroku, feel free to check out their website on how to set it up.

import './App.css';
import {Route,BrowserRouter,Switch} from "react-router-dom"
import Home from "./views/home"
import Signup from "./views/signup"
import Login from "./views/login"
import Profile from "./views/profile"
import AppBar from "./components/NavBar"

function App({history}) {
  return (
    <div className="App">
      <BrowserRouter>
        <AppBar/>
        <Switch>
          <Route exact path="/" component={Home} />
          <Route path="/signup" component={Signup} />
          <Route path="/login" component={Login} />
          <Route path="/profile" component={Profile} />
        </Switch>
      </BrowserRouter>
    </div>
  );
}

export default App;

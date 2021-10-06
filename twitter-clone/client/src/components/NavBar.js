import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import AppBar from '@material-ui/core/AppBar';
import Toolbar from '@material-ui/core/Toolbar';
import Typography from '@material-ui/core/Typography';
import Button from '@material-ui/core/Button';
import IconButton from '@material-ui/core/IconButton';
import MenuIcon from '@material-ui/icons/Menu';
import TwitterIcon from '@material-ui/icons/Twitter';
import axios from "axios"
import {NavLink} from "react-router-dom"

const useStyles = makeStyles((theme) => ({
  root: {
    flexGrow: 1,
  },
  menuButton: {
    marginRight: theme.spacing(2),
  },
  title: {
    flexGrow: 1,
  },
}));

export default function ButtonAppBar({history}) {
  const classes = useStyles();
  const handleclick = ()=>{
    axios.get("/logout/",{
      headers:{
        "Content-type":"application/json"
      }
    }).then(res => console.log("/home"))
    .catch(e=>console.log(e))
  }

  return (
    <div className={classes.root}>
      <AppBar position="static" style={{backgroundColor:"#1DA1F2",width:100+"vw"}}>
        <Toolbar>
          <IconButton edge="start" className={classes.menuButton} color="inherit" aria-label="menu">
            <MenuIcon />
          </IconButton>
          <Typography variant="h6" className={classes.title}>
                <NavLink to="/profile"><TwitterIcon /> Twitter</NavLink>
          </Typography>
          <NavLink to="/profile"><Button color="inherit">Profile</Button></NavLink>
          <NavLink to="/login"><Button color="inherit">Login</Button></NavLink>
          <NavLink to="/"><Button color="inherit" onClick={handleclick}>logout</Button></NavLink>
        </Toolbar>
      </AppBar>
    </div>
  );
}

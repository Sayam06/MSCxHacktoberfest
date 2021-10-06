import React,{useState,useEffect} from 'react';
import { makeStyles } from '@material-ui/core/styles';
import clsx from 'clsx';
import Card from '@material-ui/core/Card';
import CardHeader from '@material-ui/core/CardHeader';
import CardContent from '@material-ui/core/CardContent';
import CardActions from '@material-ui/core/CardActions';
import Collapse from '@material-ui/core/Collapse';
import Avatar from '@material-ui/core/Avatar';
import IconButton from '@material-ui/core/IconButton';
import Typography from '@material-ui/core/Typography';
import { blue, red } from '@material-ui/core/colors';
import FavoriteIcon from '@material-ui/icons/Favorite';
import ShareIcon from '@material-ui/icons/Share';
import {TextField,Button} from '@material-ui/core';
import MoreVertIcon from '@material-ui/icons/MoreVert';
import axios from "axios"
import getCookie from "../functions/getCookies"
import ChatBubbleIcon from '@material-ui/icons/ChatBubble';
import CommentCard from "./comment"

const useStyles = makeStyles((theme) => ({
  root: {
    width: 900,
    marginBottom: 20,
  },
  expand: {
    transform: 'rotate(0deg)',
    marginLeft: 'auto',
    transition: theme.transitions.create('transform', {
      duration: theme.transitions.duration.shortest,
    }),
  },
  expandOpen: {
    transform: 'rotate(180deg)',
  },
  avatar: {
    backgroundColor: blue[500],
  },
}));

export default function TweetCard({first_name="Admin",username="adminOP",text="Demo",likes=0,id=0}) {
  const classes = useStyles();
  const [expanded, setExpanded] = React.useState(false);
  const [tweetLike,setTweetLike] = useState(likes)
  const [tweet_id,setTweet_id] = useState(id)
  const [comment,setComment] = useState("")
  const [tweetComments,setTweetComments] = useState([])

  const addComment = (comment)=>{
    setTweetComments(prev =>{
      return[
        ...prev,
        comment
      ]
    })
  }

  const handleComment = ()=>{
    if(comment != ""){
      const data = {
        text : comment,
        tweet_id: tweet_id
      }
      axios.post("/post-comment/",data,{
        headers:{
          "Content-type":"application/json",
          "X-CSRFToken":getCookie("csrftoken")
      }
      }).then(data=>{
        //console.log(data)
        if(data.data.msg === "success"){
          addComment(data.data.comment)
        }
      })
      .catch(e=>console.log(e))
    }
  }

  const handleExpandClick = () => {
    setExpanded(!expanded);
    if(!expanded){
      axios.get(`/post-comment/?tweet_id=`+tweet_id,{
        headers:{
          "Content-type":"application/json",
          "X-CSRFToken":getCookie("csrftoken")
      }
      }).then(data => {
        console.log(data.data)
        setTweetComments(data.data.comments)
      })
      .catch(e=>console.log(e))
    }
  };

  const handleLike =()=>{
    axios.post("/like/",{id},{
      headers:{
        "X-CSRFToken":getCookie("csrftoken")
      }
    }).then(res => {
      console.log(res.data)
      if (res.data.msg === "success"){
        setTweetLike(res.data.tweet.likes)
        setComment("")
      }
    })
    .catch(e=>console.log(e))
  }
  return (
    <Card style={{width:"80vw"}} className={classes.root}>
      <CardHeader
        avatar={
          <Avatar aria-label="recipe" className={classes.avatar}>
            {`${first_name.charAt(0).toUpperCase()}`}
          </Avatar>
        }
        action={
          <IconButton aria-label="settings">
            <MoreVertIcon />
          </IconButton>
        }
        title={`${first_name}`}
        subheader={`@${username}`}
      />
      <CardContent>
        <Typography variant="body2" color="textPrimary" component="p">
          {text}
        </Typography>
      </CardContent>
      <CardActions disableSpacing>
        <IconButton onClick={handleLike} aria-label="add to favorites">
          <FavoriteIcon />
        </IconButton>
        <span>{tweetLike}</span>
        <IconButton aria-label="share">
          <ShareIcon />
        </IconButton>
        <IconButton
          // className={clsx(classes.expand, {
          //   [classes.expandOpen]: expanded,
          // })}
          onClick={handleExpandClick}
          aria-expanded={expanded}
          aria-label="show more"
        >
          <ChatBubbleIcon />
        </IconButton>
      </CardActions>
      <Collapse in={expanded} timeout="auto" unmountOnExit>
        <CardContent>
        {tweetComments.map(com => <CommentCard key={com.id} first_name={com.userName} username={com.userHadle} text={com.text} likes={com.likes} /> )}
        {/* <CommentCard first_name="Elon Musk" username="eloToMoon" text="To the moon" likes={69} /> */}
        <TextField value={comment} onChange={(e)=>setComment(e.target.value)} style={{width:100+"%"}} id="standard-basic" label="Comment" />
        <Button onClick={handleComment} variant="contained" style={{marginTop:20,marginBottom:20,float:"right"}} color="primary">Comment</Button>
        </CardContent>
      </Collapse>
    </Card>
  );
}

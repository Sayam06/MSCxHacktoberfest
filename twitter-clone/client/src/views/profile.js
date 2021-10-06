import React,{useState,useEffect} from "react"
import TweetCard from "../components/tweet"
import axios from "axios"
import {TextField , Button} from "@material-ui/core"
import getCookie from "../functions/getCookies"

export default function Profile({history}){
    const [tweets,setTweets] = useState([])
    const [csrftoken,setCsrftoken] = useState("")
    const [tweet,setTweet] = useState("")
    useEffect(()=>{
        setCsrftoken(getCookie("csrftoken"))
        axios.get("/all-tweets",{
            headers:{
                "Content-type":"application/json"
            }
        }).then(res=>{
            if(res.data.msg === "success"){
                setTweets(res.data.tweets.reverse())
            }else{
                history.replace("/")
            }
            console.log(res.data)
        })
    },[])
    const handleTweet = ()=>{
        console.log(tweet)
        const data = {
            text : tweet,
        }
        axios.post("/all-tweets/",data,{
            headers:{
                "Content-type":"application/json",
                "X-CSRFToken":csrftoken
            }
        }).then(res=>{
            console.log(res.data)
            if(res.data.msg === "success"){
                setTweets([
                    res.data.tweet,
                    ...tweets
                ])
            //setTweet("")
            }
        })
        .catch(e=>console.log(e))
    }
    return(
        <div className="profile-view">
        <TextField
        style={{width:80+"vw"}}
        onChange={(e)=>setTweet(e.target.value)}
        className="material-textfield"
          id="outlined-multiline-static"
          label="Tweet..."
          multiline
          rows={4}
          defaultValue=""
          variant="outlined"
        />
        <Button onClick={handleTweet} className="tweet-btn" color="primary" variant="contained">Tweet</Button>
            {/* <TweetCard className="tweet-card" />
            <TweetCard className="tweet-card" />
            <TweetCard className="tweet-card" /> */}
            {tweets.map(tweet => <TweetCard key={tweet.id} first_name={tweet.userName} username={tweet.userHandle} likes={tweet.likes} text={tweet.text} id={tweet.id} />)}
        </div>
    )
}
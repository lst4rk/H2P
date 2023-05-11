import React, {useState, useEffect} from 'react';
import axios from "axios";
import {useParams} from 'react-router-dom';


function Show() {
    const {id} = useParams();
    const [ask, setAsk] = useState(null);

    function loadAsk() {
        axios
            .get(`/api/version1/asks/${id}`)
            .then((res) => {
                setAsk(res.data)
            })
            .catch((err) => console.log(err))
    }

    useEffect(() => {
        loadAsk()
    }, [id])
    return (
        <div>
            {ask !== null && (
                <div>
                    <h1>{ask.title}</h1>
                    <p>{ask.body}</p>
                </div>
            )}
        </div>
    )
}

export default Show;
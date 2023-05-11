import React from 'react';
import {Link} from "react-router-dom";

function Header() {
    return (
        <h1 className="text-5xl uppercase py-6">
            <Link to="/">Find Feelings</Link>
        </h1>
    );
}

export default Header;
import React from 'react';

function Ask(props) {
    return (
        <li className="border p-6 backdrop-blur-sm bg-white bg-opacity-20 flex flex-col justify-between">
            <div className="text-left pb-5">
                {props.title}
            </div>
            <div className="text-right pt-5">
                {props.body}
            </div>
            <ul className="flex justify-end">
                <li className="border text-right my-4 p-2 text-xs max-w-min hover:bg-white hover:border-black hover:bg-opacity-70 hover:text-black">
                    {/*<a href="/asks/destroy" turbo_method=":delete" turbo_confirm="Are you sure?">destroy</a>*/}
                </li>
            </ul>

        </li>
    )
}

export default Ask
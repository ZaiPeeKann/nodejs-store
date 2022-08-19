import React from 'react';
import classes from './Button.module.css'

const Button = ({text, onClick}) => {

	return (
		<div onClick={onClick} className={classes.button}>
			{text}
		</div>
	);
};

export default Button;

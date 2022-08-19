import React, {useState} from 'react';
import classes from './Input.module.css'

const Input = ({placeholder}) => {
	const [value, setValue] = useState('')

	return (
		<div className={classes.wrapper}>
			<input
				placeholder={placeholder}
				className={classes.input}
				type="text"
				value={value}
				onChange={event => setValue(event.target.value)}
			/>
		</div>
	);
};

export default Input;
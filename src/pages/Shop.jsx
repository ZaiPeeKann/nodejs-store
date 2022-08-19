import React, {useContext} from 'react';
import classes from '../styles/Shop.module.css'
import {Context} from "../index";

const Shop = () => {

	const {device} = useContext(Context)

	return (
		<div className={classes.container}>
			<div className={classes.settings}>
				<ul className={classes.list}>
					{device._types.map((type) =>
						<li
							onClick={() => device.setSelectedType(type)}
							className={classes.item}
							key={type.id}>
							{type.name}
						</li>
					)}
				</ul>
			</div>
		</div>
	);
};

export default Shop;

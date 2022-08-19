import React, {useContext} from 'react';
import {Context} from "../index";
import {Link, NavLink} from "react-router-dom";
import {observer} from "mobx-react-lite";
import classes from '../styles/Navbar.module.css'

const NavBar = observer(() => {
	const {user} = useContext(Context)
	return (
		<div className={classes.navbar}>
			<div className={classes.navcontainer}>
				<NavLink to="/" className={classes.title}>eShop</NavLink>
				{user.isAuth ?
					<ul>
						<li><Link to="/admin">Админ панель</Link></li>
						<li><Link to="/" onClick={() => user.setIsAuth(false)}>Выйти</Link></li>
						<li><Link to="/basket">Корзина</Link></li>
					</ul>
					:
					<ul>
						<li><Link to="/login">Авторизация</Link></li>
					</ul>
				}
			</div>
		</div>
	);
});

export default NavBar;

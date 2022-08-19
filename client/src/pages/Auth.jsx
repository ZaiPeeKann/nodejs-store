import React, {useContext} from 'react';
import classes from '../styles/Auth.module.css'
import Input from "../components/Input/Input";
import {Link, NavLink, useLocation} from "react-router-dom";
import {Context} from "../index";

const Auth = () => {

	const context = useContext(Context);
	const location = useLocation();
	const isLogin =	location.pathname === '/login';

	return (
		<div className={classes.container}>
			<div className={classes.card}>
				<h2 className={classes.title}>
					{isLogin ? 'Авторизация' : 'Регистрация'}
				</h2>
				<div className={classes.form}>
					<Input/>
					<Input/>
					<div className={classes.row}>
						{isLogin ?
							<div className={classes.reg}>Нет аккаунта? <NavLink to='/registration'>Зарегистрируйся!</NavLink></div> :
							<div className={classes.reg}>Есть аккаунт? <NavLink to='/login'>Войди!</NavLink></div>
						}
						<Link to='/' className={classes.button} onClick={context.user.setIsAuth(true)}>Войти</Link>
					</div>
				</div>
			</div>
		</div>
	);
};

export default Auth;

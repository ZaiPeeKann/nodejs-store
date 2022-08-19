import React, {useContext} from 'react';
import {Routes, Route, Navigate} from 'react-router-dom'
import {authRoutes, publicRoutes} from "../routes";
import {Context} from "../index";

const AppRouter = () => {
	const {user} = useContext(Context)
	return (
		<Routes>
			{publicRoutes.map(({path, component}) =>
				<Route key={path} path={path} element={component} />
			)}
			{user.isAuth && authRoutes.map(({path, component}) =>
				<Route key={path} path={path} element={component} />
			)}
			<Route path="*" element={<Navigate to="/" replace/>}/>
		</Routes>
	);
};

export default AppRouter;

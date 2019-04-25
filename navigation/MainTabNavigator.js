import React from 'react';
import { Platform } from 'react-native';
import { createStackNavigator, createBottomTabNavigator } from 'react-navigation';

import TabBarIcon from '../components/TabBarIcon';
import GarageScreen from '../screens/GarageScreen';
import LinksScreen from '../screens/LinksScreen';
import { MaterialCommunityIcons } from '@expo/vector-icons';

const GarageStack = createStackNavigator({
	Garage: GarageScreen
});

GarageStack.navigationOptions = {
	tabBarLabel: 'Garage',
	tabBarIcon: <MaterialCommunityIcons name="garage" size={28} color="red" />
};

const LinksStack = createStackNavigator({
	Links: LinksScreen
});

LinksStack.navigationOptions = {
	tabBarLabel: 'Links',
	tabBarIcon: ({ focused }) => <TabBarIcon focused={focused} name={Platform.OS === 'ios' ? 'ios-link' : 'md-link'} />
};

export default createBottomTabNavigator({
	GarageStack,
	LinksStack
});

// const SettingsStack = createStackNavigator({
// 	Settings: SettingsScreen
// });

// SettingsStack.navigationOptions = {
// 	tabBarLabel: 'Settings',
// 	tabBarIcon: ({ focused }) => (
// 		<TabBarIcon focused={focused} name={Platform.OS === 'ios' ? 'ios-options' : 'md-options'} />
// 	)
// };


import 'package:flutter/material.dart';
import 'package:flutter_smart_home/util/smart_device_box.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
    const HomePage({super.key});

	@override
	State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

	// padding constants
	final double horizontalPadding = 40;
	final double verticalPadding = 25;

	// list of smart devices
	List mySmartDevices = [
		['Smart Light', 'lib/icons/light-bulb.png', true],
		['Smart Fan', 'lib/icons/fan.png', false],
		['Smart TV', 'lib/icons/smart-tv.png', false],
		['Smart Air', 'lib/icons/air-conditioner.png', false]
	];

	// handle switch power
	void powerStateChange(bool value, int index)
	{
		setState(() {
			mySmartDevices[index][2] = value;
		});
	}
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: Colors.grey[300],
			body: SafeArea(
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
						Padding(padding: EdgeInsets.symmetric(
							horizontal: horizontalPadding,
							vertical: verticalPadding),
						child:	Row(
							mainAxisAlignment: MainAxisAlignment.spaceBetween,
							children: [
									// menu Icon
									Image.asset(
										'lib/icons/fan.png',
										height: 45,
										color: Colors.grey[800],),
									// account icon
									Icon(
										Icons.person,
										size: 45,
										color: Colors.grey[800],
									)
								],
							)
						),
						const SizedBox(height: 20),

						// welcome home
						Padding(
							padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
							child: Column(
								crossAxisAlignment: CrossAxisAlignment.start,
								children: [
									const Text("Welcome Home, "),
									Text(
										"TRAN NGOC PHUOC",
										style: GoogleFonts.bebasNeue(),
										)
								]
							),
						),
						const SizedBox(height: 20),
						Padding(padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
							child: const Column(
								children: [
									Text("Smart Devices")
								],
							)
						),
						Expanded(
							child: GridView.builder(
								itemCount: mySmartDevices.length,
								padding: const EdgeInsets.all(25),
								gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
									crossAxisCount: 2,
									childAspectRatio: 1 / 1.3
								), 
								itemBuilder: (context, index) {
									return SmartDeviceBox(
										smartDeviceName: mySmartDevices[index][0], 
										iconPath: mySmartDevices[index][1], 
										powerState: mySmartDevices[index][2],
										onChanged: (value) => powerStateChange(value, index),
										);
								}),
						)
					],
				)
			),
		); 
	}
}
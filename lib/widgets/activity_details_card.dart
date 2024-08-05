import 'package:flutter/material.dart';
import '../model/health_model.dart';
import '../responsive.dart';
import 'custom_card.dart';

class ActivityDetailsCard extends StatelessWidget {
  const ActivityDetailsCard({super.key});

  final List<HealthModel> healthDetails = const [
    HealthModel(
        icon: 'assets/gross.png', value: "50000", title: "Total Amount"),
    HealthModel(
        icon: 'assets/folder.png', value: "10,000", title: "Pending Amount"),
    HealthModel(icon: 'assets/agent.png', value: "10", title: "Agents Alloted"),
    HealthModel(icon: 'assets/task.png', value: "6", title: "Plan"),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GridView.builder(
      itemCount: healthDetails.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
          crossAxisSpacing: !Responsive.isMobile(context) ? 15 : 12,
          mainAxisSpacing: 12.0),
      itemBuilder: (context, i) {
        return CustomCard(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: 40,
                  width: 50,
                  child: Image.asset(healthDetails[i].icon)),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 4),
                child: Text(
                  healthDetails[i].value,
                  style: TextStyle(
                      fontSize: 18,
                      color: theme.textTheme.bodyLarge!.color,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                healthDetails[i].title,
                style: TextStyle(
                    fontSize: 13,
                    color: theme.textTheme.bodyMedium!.color,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        );
      },
    );
  }
}

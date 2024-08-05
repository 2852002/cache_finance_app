import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');
  int _carouselIndex = 0; // Track the current index of the CarouselSlider

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final textColor = Theme.of(context).textTheme.bodyLarge!.color!;
    final borderColor = Theme.of(context).dividerColor;
    final Color cardColor = theme.cardColor;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(
          'Reports',
          style: TextStyle(color: textColor),
        ),
        backgroundColor: backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Start Date',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: textColor,
                    ),
                  ),
                  _buildDateField(
                    _startDate,
                    (selectedDate) {
                      setState(() {
                        _startDate = selectedDate;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'End Date',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: textColor,
                    ),
                  ),
                  _buildDateField(
                    _endDate,
                    (selectedDate) {
                      setState(() {
                        _endDate = selectedDate;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Analytics',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 16),
              CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  viewportFraction: 1.0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  onPageChanged: (index, reason) {
                    setState(() {
                      _carouselIndex = index;
                    });
                  },
                ),
                items: [
                  _buildPieChart(),
                  _buildBarChart(),
                  _buildLineChart(),
                ],
              ),
              const SizedBox(height: 16),
              if (_carouselIndex == 0)
                _buildPieChartLegend(), // Show legend only when pie chart is visible
              const SizedBox(height: 16),
              Text(
                'Agent Details',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 16),
              _buildAgentDetails(borderColor, textColor, cardColor),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPieChartLegend() {
    final List<_ChartData> chartData = _getChartData();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: chartData.map((data) {
        return Row(
          children: [
            Container(
              width: 16,
              height: 16,
              color: _getColorForCategory(
                  data.category), // Function to determine the color
            ),
            const SizedBox(width: 8),
            Text(
              data.category,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        );
      }).toList(),
    );
  }

  Color _getColorForCategory(String category) {
    switch (category) {
      case 'Elite Plan':
        return const Color(0xFF315A74);
      case 'Paid Dues':
        return const Color(0xFF06AEE0);
      case 'Unpaid Dues':
        return const Color(0xFF6355C7);
      // Add more cases if needed
      default:
        return Colors.grey;
    }
  }

  Widget _buildDateField(
    DateTime selectedDate,
    void Function(DateTime) onDateSelected,
  ) {
    return TextField(
      controller: TextEditingController(text: _dateFormat.format(selectedDate)),
      readOnly: true,
      decoration: InputDecoration(
        fillColor: Colors.transparent,
        suffixIcon: IconButton(
          icon: const Icon(Icons.calendar_today),
          onPressed: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: selectedDate,
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
            );
            if (pickedDate != null && pickedDate != selectedDate) {
              onDateSelected(pickedDate);
            }
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );
        if (pickedDate != null && pickedDate != selectedDate) {
          onDateSelected(pickedDate);
        }
      },
    );
  }

  Widget _buildPieChart() {
    return SfCircularChart(
      series: <CircularSeries<_ChartData, String>>[
        PieSeries<_ChartData, String>(
          dataSource: _getChartData(),
          xValueMapper: (_ChartData data, _) => data.category,
          yValueMapper: (_ChartData data, _) => data.value,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
        ),
      ],
    );
  }

  Widget _buildBarChart() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(
          labelStyle: TextStyle(
              color: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .color!), // Set label text color to theme text color
        ),
        primaryYAxis: NumericAxis(
          labelStyle: TextStyle(
              color: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .color!), // Set label text color to theme text color
        ),
        series: <CartesianSeries<_ChartData, String>>[
          BarSeries<_ChartData, String>(
            dataSource: _getChartData(),
            xValueMapper: (_ChartData data, _) => data.category,
            yValueMapper: (_ChartData data, _) => data.value,
            dataLabelSettings: DataLabelSettings(
              isVisible: true,
              textStyle: TextStyle(
                  color: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .color!), // Set data label text color to theme text color
            ),
            pointColorMapper: (_ChartData data, _) =>
                _getColorForCategory(data.category), // Assign color
          ),
        ],
      ),
    );
  }

  Widget _buildLineChart() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(
          labelStyle: TextStyle(
              color: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .color!), // Set label text color to theme text color
        ),
        primaryYAxis: NumericAxis(
          labelStyle: TextStyle(
              color: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .color!), // Set label text color to theme text color
        ),
        series: <CartesianSeries<_ChartData, String>>[
          LineSeries<_ChartData, String>(
            dataSource: _getChartData(),
            xValueMapper: (_ChartData data, _) => data.category,
            yValueMapper: (_ChartData data, _) => data.value,
            dataLabelSettings: DataLabelSettings(
              isVisible: true,
              textStyle: TextStyle(
                  color: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .color!), // Set data label text color to theme text color
            ),
            pointColorMapper: (_ChartData data, _) =>
                _getColorForCategory(data.category), // Assign color
          ),
        ],
      ),
    );
  }

  Widget _buildAgentDetails(
      Color borderColor, Color textColor, Color cardColor) {
    return Card(
      color: cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(width: 0.9, color: borderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.account_circle,
                  size: 38,
                  color: Colors.blueGrey,
                ),
                const SizedBox(width: 8),
                Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: textColor, // Use theme's text color
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Total Collected with Bold Text
            Row(
              children: [
                Text(
                  'Total Collected: ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold, // Make text bold
                    color: textColor, // Use theme's text color
                  ),
                ),
                Text(
                  '\$1500',
                  style: TextStyle(
                    fontSize: 16,
                    color: textColor, // Use theme's text color
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            // Total Pending with Bold Text
            Row(
              children: [
                Text(
                  'Total Pending: ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold, // Make text bold
                    color: textColor, // Use theme's text color
                  ),
                ),
                Text(
                  '\$200',
                  style: TextStyle(
                    fontSize: 16,
                    color: textColor, // Use theme's text color
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            // Total Users with Bold Text
            Row(
              children: [
                Text(
                  'Total Users: ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold, // Make text bold
                    color: textColor, // Use theme's text color
                  ),
                ),
                Text(
                  '35',
                  style: TextStyle(
                    fontSize: 16,
                    color: textColor, // Use theme's text color
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<_ChartData> _getChartData() {
    return [
      _ChartData('Elite Plan', 30),
      _ChartData('Paid Dues', 40),
      _ChartData('Unpaid Dues', 30),
    ];
  }
}

class _ChartData {
  _ChartData(this.category, this.value);

  final String category;
  final double value;
}

import 'package:flutter/material.dart';

class StateReportScreen extends StatelessWidget {
  const StateReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,

      body: Container(
        width: double.infinity,

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE8F8F7), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: SingleChildScrollView(
          // padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              Padding(padding: const EdgeInsets.all(18.0), child: _header()),
              const SizedBox(height: 25),
              Container(
                width: double.infinity,
                // padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(width * 0.14),
                    topRight: Radius.circular(width * 0.14),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: _todayCard(context),
                    ),
                    const SizedBox(height: 25),
                    _sleepInfo(),

                    const SizedBox(height: 25),
                    _timeInBedChart(),
                  ],
                ),
              ),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "TSETSE Report Card",
          style: TextStyle(
            color: Color(0xFF008C8C),
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(
          "Analyzing your battle with the bed...",
          style: TextStyle(fontSize: 15, color: Colors.black54),
        ),
      ],
    );
  }

  Widget _todayCard(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Today + calendar icon
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Today , Friday",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color.fromRGBO(61, 90, 94, 1),
              ),
            ),
            InkWell(
              onTap: () async {
                DateTime? datetime = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1970),
                  lastDate: DateTime(2100),
                );
              },
              child: Icon(Icons.calendar_month_outlined),
            ),
          ],
        ),

        const SizedBox(height: 25),

        Row(
          children: [
            Container(
              height: 138,
              width: 164,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: const Border(
                  bottom: BorderSide(
                    color: Color.fromRGBO(61, 90, 94, 1),
                    width: 2,
                  ),
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(children: [_qualityCircle()]),
            ),

            const SizedBox(width: 10),

            // DURATION CONTAINER
            Container(
              width: 154,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: const Border(
                  bottom: BorderSide(
                    color: Color.fromRGBO(61, 90, 94, 1),
                    width: 2,
                  ),
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [_durationInfo()],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _qualityCircle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: const Text(
            "Quality",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(61, 90, 94, 1),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: CircularProgressIndicator(
                value: 0.87,
                strokeWidth: 8,
                color: Color.fromRGBO(61, 90, 94, 1),
                backgroundColor: Colors.grey.shade300,
              ),
            ),
            const Text(
              "87%",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(61, 90, 94, 1),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _durationInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Duration",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(61, 90, 94, 1),
          ),
        ),
        Text(
          "7h 25m",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(61, 90, 94, 1),
          ),
        ),
        Text(
          "Total Sleep",
          style: TextStyle(color: Colors.black54, fontSize: 12),
        ),
        SizedBox(height: 10),
        Text(
          "7h 25m",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(61, 90, 94, 1),
          ),
        ),
        Text("In bed", style: TextStyle(color: Colors.black54)),
      ],
    );
  }

  Widget _sleepInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),

        Container(
          height: 135,
          width: 345,

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: const Border(
              bottom: BorderSide(
                color: Color.fromRGBO(61, 90, 94, 1),
                width: 2,
              ),
            ),
          ),

          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    "Sleep information",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(61, 90, 94, 1),
                    ),
                  ),
                ),
              ),

              /// FIRST ROW
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  _sleepInfoItem(
                    image: AssetImage('assets/images/moon.png'),
                    time: "2h 48m",
                    label: "Deep sleep",
                  ),
                  _sleepInfoItem(
                    image: AssetImage('assets/images/sleep.png'),
                    time: "25m",
                    label: "Fell asleep",
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  _sleepInfoItem(
                    image: AssetImage('assets/images/bed.png'),
                    time: "11:25 PM",
                    label: "Went to bed",
                  ),
                  _sleepInfoItem(
                    image: AssetImage('assets/images/sun.png'),
                    time: "7:30 AM",
                    label: "Wake up",
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _infoItem extends StatelessWidget {
  final IconData icon;
  final String time;
  final String label;

  const _infoItem({
    required this.icon,
    required this.time,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Color(0xFF008C8C), size: 28),
        SizedBox(height: 5),
        Text(
          time,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 3),
        Text(label, style: const TextStyle(color: Colors.black54)),
      ],
    );
  }
}

Widget _timeInBedChart() {
  List<double> values = [70, 40, 20, 35, 55, 75, 65];

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Time in Bed",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(61, 90, 94, 1),
          ),
        ),
        const SizedBox(height: 15),

        const Text(
          "Average activity time",
          style: TextStyle(
            color: Color.fromRGBO(61, 90, 94, 1),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const Text(
              "This Week",
              style: TextStyle(color: Color.fromRGBO(61, 90, 94, 1)),
            ),
            Icon(
              size: 15,
              Icons.keyboard_arrow_down_outlined,
              color: Color.fromRGBO(61, 90, 94, 1),
            ),
          ],
        ),

        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 0),
                Text(
                  "12 AM",
                  style: TextStyle(color: Colors.black45, fontSize: 12),
                ),
                SizedBox(height: 10),
                Text(
                  "10 PM",
                  style: TextStyle(color: Colors.black45, fontSize: 12),
                ),
                SizedBox(height: 10),
                Text(
                  "9 PM",
                  style: TextStyle(color: Colors.black45, fontSize: 12),
                ),
                SizedBox(height: 10),
                Text(
                  "8 PM",
                  style: TextStyle(color: Colors.black45, fontSize: 12),
                ),
                SizedBox(height: 10),
                Text(
                  "6 PM",
                  style: TextStyle(color: Colors.black45, fontSize: 12),
                ),
              ],
            ),

            const SizedBox(width: 18),

            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(values.length, (index) {
                  return Column(
                    children: [
                      SizedBox(height: 25),
                      Container(
                        width: 18,
                        height: 128,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE3E9EA),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: Alignment.bottomCenter,

                        child: Container(
                          height: values[index],
                          decoration: BoxDecoration(
                            color: const Color(0xFF009E9E),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),

                      const SizedBox(height: 3),

                      // DAY LABELS
                      Text(
                        [
                          "sun",
                          "Mon",
                          "Tue",
                          "wed",
                          "Thu",
                          "Fri",
                          "Sat",
                        ][index],
                        style: const TextStyle(color: Colors.black45),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

class _sleepInfoItem extends StatelessWidget {
  final AssetImage image;
  final String time;
  final String label;

  const _sleepInfoItem({
    required this.image,
    required this.time,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 40),
      child: Row(
        children: [
          ClipRRect(
            child: Center(
              child: Image(image: image, fit: BoxFit.cover, height: 33),
            ),
          ),
          SizedBox(width: 10),

          // const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                time,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF3D5A5E),
                  fontSize: 16,
                ),
              ),
              Text(
                label,
                style: const TextStyle(color: Colors.black45, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

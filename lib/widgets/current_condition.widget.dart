import 'package:flutter/material.dart';

class CurrentData extends StatefulWidget {
  final String? title;
  final String? mainValue;
  final String? subValue;
  final String? image;
  const CurrentData(
      {super.key, this.mainValue, this.subValue, this.title, this.image});

  @override
  State<CurrentData> createState() => _CurrentDataState();
}

class _CurrentDataState extends State<CurrentData> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.teal[100],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title ?? '',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.mainValue ?? '',
                          style: const TextStyle(fontSize: 18),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          widget.subValue ?? '',
                          style: const TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  Image.asset(
                    width: 80, // Adjust width as needed
                    height: 80,
                    '${'assets/images/'}${widget.image}${'.png'}',
                    fit: BoxFit.cover,
                  )
                ],
              ),
            ],
          ),
        ));
  }
}

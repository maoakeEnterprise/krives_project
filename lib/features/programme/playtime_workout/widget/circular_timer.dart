import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:krives_project/core/data/datasrouces/circular_timer_painter.dart';
import 'package:krives_project/features/programme/playtime_workout/bloc/counter_series_bloc/counter_series_bloc.dart';
import 'package:krives_project/features/programme/playtime_workout/bloc/timer_bloc/timer_bloc.dart';
import 'button_widget_timer.dart';

class CircularTimer extends StatefulWidget {
  final int initialDuration; // Timer duration in seconds
  final Color color;
  final Color backgroundColor;

  const CircularTimer({
    super.key,
    required this.initialDuration,
    this.color = Colors.blue,
    this.backgroundColor = Colors.grey,
  });

  @override
  _CircularTimerState createState() => _CircularTimerState();
}

class _CircularTimerState extends State<CircularTimer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late int _remainingDuration;

  @override
  void initState() {
    super.initState();
    _remainingDuration = widget.initialDuration;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: _remainingDuration),
    )..addListener(() {
      setState(() {
        int seconds  = _remainingDuration * (1 - _controller.value).ceil();
        if(seconds == 0){
          context.read<CounterSeriesBloc>().add(CounterSerieIncremented());
          context.read<TimerBloc>().add(TimerFinishedSeriesPressed());
        }
      });
    });

    _controller.forward(); // Start the timer
  }

  void _addTime(int seconds) {
    setState(() {
      if(_remainingDuration != 0){
        _remainingDuration = (_remainingDuration * (1 - _controller.value)).ceil() + seconds;
      }
      _controller.stop();
      _controller.duration = Duration(seconds: _remainingDuration);
      _controller.forward(from: _controller.value = 0); // Resume animation
    });
  }


  void _removeTime(int seconds) {
    setState(() {
      if(_remainingDuration > seconds) {
        _remainingDuration = (_remainingDuration * (1 - _controller.value)).ceil() - seconds;
      } else {
        _remainingDuration = 1;
      }
      _controller.stop();
      _controller.duration = Duration(seconds: _remainingDuration);
      _controller.forward(from: _controller.value = 0); // Resume animation
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 150,
          width: 150, // Fix the size of the circle
          child: CustomPaint(
            painter: CircularTimerPainter(
              progress: _controller.value,
              color: widget.color,
              backgroundColor: widget.backgroundColor,
            ),
            child: Center(
              child: Text(
                '${(_remainingDuration * (1 - _controller.value)).ceil()} s',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: widget.color,
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonWidgetTimer(
                label: "- 30s",
                onPressed: () => _removeTime(30), // Add 30 seconds on tap
              ),
              ButtonWidgetTimer(
                label: "+ 30s",
                onPressed: () => _addTime(30), // Add 30 seconds on tap
              ),
            ],
          ),
        ),
      ],
    );
  }
}

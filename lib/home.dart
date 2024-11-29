import 'package:flutter/material.dart';
import 'package:flutter_projectOne/chinesezodiac.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  final String name;

  const HomePage({required this.name, super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDate = DateTime.now();
  DateTime _focusedDate = DateTime.now();
  String _horoscope = "";
  late ChineseZodiac _chineseZodiac;

  // Function to calculate horoscope based on the birthdate
  String getHoroscope(DateTime date) {
    final int day = date.day;
    final int month = date.month;

    if ((month == 3 && day >= 21) || (month == 4 && day <= 19)) {
      return "Aries";
    } else if ((month == 4 && day >= 20) || (month == 5 && day <= 20)) {
      return "Taurus";
    } else if ((month == 5 && day >= 21) || (month == 6 && day <= 20)) {
      return "Gemini";
    } else if ((month == 6 && day >= 21) || (month == 7 && day <= 22)) {
      return "Cancer";
    } else if ((month == 7 && day >= 23) || (month == 8 && day <= 22)) {
      return "Leo";
    } else if ((month == 8 && day >= 23) || (month == 9 && day <= 22)) {
      return "Virgo";
    } else if ((month == 9 && day >= 23) || (month == 10 && day <= 22)) {
      return "Libra";
    } else if ((month == 10 && day >= 23) || (month == 11 && day <= 21)) {
      return "Scorpio";
    } else if ((month == 11 && day >= 22) || (month == 12 && day <= 21)) {
      return "Sagittarius";
    } else if ((month == 12 && day >= 22) || (month == 1 && day <= 19)) {
      return "Capricorn";
    } else if ((month == 1 && day >= 20) || (month == 2 && day <= 18)) {
      return "Aquarius";
    } else {
      return "Pisces";
    }
  }

  final List<ChineseZodiac> chineseZodiacs = [
    ChineseZodiac(
      name: "Rat",
      imageUrl: "assets/images/rat_zodiac.png",
      years: [1924, 1936, 1948, 1960, 1972, 1984, 1996, 2008, 2020],
      luckyColor: "Blue",
      luckyNumber: 2,
    ),
    ChineseZodiac(
      name: "Ox",
      imageUrl: "assets/images/ox_zodiac.png",
      years: [1925, 1937, 1949, 1961, 1973, 1985, 1997, 2009, 2021],
      luckyColor: "White",
      luckyNumber: 8,
    ),
    ChineseZodiac(
      name: "Tiger",
      imageUrl: "assets/images/tiger_zodiac.png",
      years: [1926, 1938, 1950, 1962, 1974, 1986, 1998, 2010, 2022],
      luckyColor: "Green",
      luckyNumber: 3,
    ),
    ChineseZodiac(
        name: "Rabbit",
        imageUrl: "assets/images/rabbit_zodiac.png",
        years: [1927, 1939, 1951, 1963, 1975, 1987, 1999, 2011, 2023],
        luckyColor: "Black",
        luckyNumber: 10),
    ChineseZodiac(
      name: "Dragon",
      imageUrl: "assets/images/dragon_zodiac.jpeg",
      years: [1928, 1940, 1952, 1964, 1976, 1988, 2000, 2012, 2024],
      luckyColor: "Orange",
      luckyNumber: 11,
    ),
    ChineseZodiac(
      name: "Snake",
      imageUrl: "assets/images/snake_zodiac.png",
      years: [1929, 1941, 1953, 1965, 1977, 1989, 2001, 2013, 2025],
      luckyColor: "Green",
      luckyNumber: 12,
    ),
    ChineseZodiac(
      name: "Horse",
      imageUrl: "assets/images/horse_zodiac.png",
      years: [1930, 1942, 1954, 1966, 1978, 1990, 2002, 2014, 2026],
      luckyColor: "yellow",
      luckyNumber: 14,
    ),
    ChineseZodiac(
      name: "Goat",
      imageUrl: "assets/images/goat_zodiac.jpeg",
      years: [1931, 1943, 1955, 1967, 1979, 1991, 2003, 2015, 2027],
      luckyColor: "blue",
      luckyNumber: 15,
    ),
    ChineseZodiac(
      name: "Monkey",
      imageUrl: "assets/images/monkey_zodiac.jpeg",
      years: [1932, 1944, 1956, 1968, 1980, 1992, 2004, 2016, 2028],
      luckyColor: "grey",
      luckyNumber: 16,
    ),
    ChineseZodiac(
      name: "Rooster",
      imageUrl: "assets/images/rooster_zodiac.png",
      years: [1933, 1945, 1957, 1969, 1981, 1993, 2005, 2017, 2029],
      luckyColor: "pink",
      luckyNumber: 17,
    ),
    ChineseZodiac(
      name: "Dog",
      imageUrl: "assets/images/dog_zodiac.png",
      years: [1934, 1946, 1958, 1970, 1982, 1994, 2006, 2018, 2030],
      luckyColor: "brown",
      luckyNumber: 18,
    ),
    ChineseZodiac(
      name: "Pig",
      imageUrl: "assets/images/pig_zodiac.png",
      years: [1935, 1947, 1959, 1971, 1983, 1995, 2007, 2019, 2031],
      luckyColor: "red",
      luckyNumber: 18,
    ),
  ];

  ChineseZodiac getChineseZodiac(int year) {
    for (var zodiac in chineseZodiacs) {
      if (zodiac.years.contains(year)) {
        return zodiac;
      }
    }
    // Return a default or error if the year is not found
    return ChineseZodiac(
      name: "Unknown",
      imageUrl: "",
      years: [],
      luckyColor: "N/A",
      luckyNumber: 0,
    );
  }

  Future<void> _selectYear(BuildContext context) async {
    final currentYear = DateTime.now().year;
    int selectedYear = _focusedDate.year;

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select Year'),
          content: SizedBox(
            height: 250,
            width: 300,
            child: YearPicker(
              firstDate: DateTime(1900),
              lastDate: DateTime(currentYear),
              initialDate: DateTime(selectedYear),
              selectedDate: DateTime(selectedYear),
              onChanged: (DateTime date) {
                setState(() {
                  _focusedDate =
                      DateTime(date.year, _focusedDate.month, _focusedDate.day);
                  _chineseZodiac = getChineseZodiac(date.year);
                });
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello ${widget.name}!!',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  letterSpacing: 1.5,
                  fontFamily: 'Cinzel',
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Select your birthdate:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'Cinzel',
                    letterSpacing: 1,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TableCalendar(
                firstDay: DateTime(1900),
                lastDay: DateTime.now(),
                focusedDay: _focusedDate,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDate, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDate = selectedDay;
                    _focusedDate = focusedDay;
                    _horoscope = getHoroscope(selectedDay);
                    _chineseZodiac = getChineseZodiac(selectedDay.year);
                  });
                  // Show the Bottom Sheet
                  _showHoroscopeBottomSheet(context);
                },
                calendarStyle: const CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.purple,
                    shape: BoxShape.circle,
                  ),
                  defaultTextStyle: TextStyle(color: Colors.white),
                  weekendTextStyle: TextStyle(color: Colors.orange),
                ),
                headerVisible: false, // Hides default header
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _focusedDate = DateTime(
                          _focusedDate.year,
                          _focusedDate.month - 1,
                        );
                      });
                    },
                    icon: const Icon(Icons.chevron_left, color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () => _selectYear(context),
                    child: Text(
                      DateFormat.yMMMM().format(_focusedDate),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Cinzel',
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _focusedDate = DateTime(
                          _focusedDate.year,
                          _focusedDate.month + 1,
                        );
                      });
                    },
                    icon: const Icon(Icons.chevron_right, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showHoroscopeBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black, // Black background
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_horoscope.isNotEmpty)
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Row(
                        children: [
                          const Text(
                            'Your Horoscope is:',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Cinzel',
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            _horoscope,
                            style: const TextStyle(
                              color: Colors.orange,
                              fontSize: 24,
                              fontFamily: 'Cinzel',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Image.asset(_chineseZodiac.imageUrl,
                          width: 150, height: 150),
                    ),
                  ],
                ),
              ...[
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Row(
                    children: [
                      const Text(
                        'Your Chinese Zodiac is:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Cinzel',
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        _chineseZodiac.name,
                        style: const TextStyle(
                          color: Colors.orange,
                          fontSize: 24,
                          fontFamily: 'Cinzel',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Row(
                    children: [
                      const Text(
                        'Your lucky number is:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Cinzel',
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${_chineseZodiac.luckyNumber}',
                        style: const TextStyle(
                          color: Colors.orange,
                          fontSize: 24,
                          fontFamily: 'Cinzel',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Row(
                    children: [
                      const Text(
                        'Your lucky color is:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Cinzel',
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        _chineseZodiac.luckyColor,
                        style: const TextStyle(
                          color: Colors.orange,
                          fontSize: 24,
                          fontFamily: 'Cinzel',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}

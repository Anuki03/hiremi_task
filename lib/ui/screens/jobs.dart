import 'package:flutter/material.dart';

class Jobs extends StatelessWidget {
  const Jobs({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hiremi'),
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              ProfileSection(),
              ExploreHiremiSection(),
              FeaturedSection(),
              JobListingSection(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work),
              label: 'Hiremi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Row(
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage('images/verification.jpg'),
              ),
              SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Review & Verify Your Profile',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  LinearProgressIndicator(value: 0.25),
                  SizedBox(height: 8.0),
                  Text('Harsh Pawar - Not Verified'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Verify Now'),
          ),
        ],
      ),
    );
  }
}

class ExploreHiremiSection extends StatelessWidget {
  const ExploreHiremiSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.blue[50],
      child: Row(
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Are you a College Student?',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text('Get your Mentor Today'),
            ],
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Verify Now'),
          ),
        ],
      ),
    );
  }
}

class FeaturedSection extends StatelessWidget {
  const FeaturedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CategoryButton('Internships', Colors.orange),
          CategoryButton('Fresher Jobs', Colors.pink),
          CategoryButton('Experienced Jobs', Colors.purple),
        ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String text;
  final Color color;

  const CategoryButton(this.text, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
        ),
        child: Text(text),
      ),
    );
  }
}

class JobListingSection extends StatelessWidget {
  const JobListingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Jr. Java Programmer',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              const Text('CRTD Technologies'),
              const SizedBox(height: 8.0),
              const Row(
                children: [
                  Icon(Icons.location_on, size: 16.0),
                  SizedBox(width: 4.0),
                  Text('Bhopal, Madhya Pradesh, India'),
                ],
              ),
              const SizedBox(height: 8.0),
              const Row(
                children: [
                  Icon(Icons.school, size: 16.0),
                  SizedBox(width: 4.0),
                  Expanded(
                    child: Text(
                      'BE/B.TECH/M.TECH/MCA/MBA/BCA/BSC/MSC',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              const Row(
                children: [
                  Icon(Icons.attach_money, size: 16.0),
                  SizedBox(width: 4.0),
                  Text('₹ 4.75 LPA'),
                ],
              ),
              const SizedBox(height: 12.0),
              const Row(
                children: [
                  JobTag('Remote', Colors.orange),
                  SizedBox(width: 8.0),
                  JobTag('Job', Colors.pink),
                  SizedBox(width: 8.0),
                  JobTag('2 Year Exp', Colors.purple),
                ],
              ),
              const SizedBox(height: 12.0),
              const Text(
                'Actively Recruiting',
                style: TextStyle(color: Colors.green),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '6 days ago',
                    style: TextStyle(color: Colors.grey),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text('Apply Now'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class JobTag extends StatelessWidget {
  final String text;
  final Color color;

  const JobTag(this.text, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Text(
        text,
        style: TextStyle(color: color),
      ),
    );
  }
}

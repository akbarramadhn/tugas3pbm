import 'package:flutter/material.dart';

void main() {
  runApp(const MyProfileApp());
}

// ================= MODEL DATA =================
class ProfileData {
  String nama;
  String ttl;
  String gender;
  String alamat;
  String agama;
  String pendidikan;
  String phone;
  String email;

  ProfileData({
    required this.nama,
    required this.ttl,
    required this.gender,
    required this.alamat,
    required this.agama,
    required this.pendidikan,
    required this.phone,
    required this.email,
  });
}

// ================= ROOT APP =================
class MyProfileApp extends StatelessWidget {
  const MyProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profil Mahasiswa',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      home: const InputProfilePage(),
    );
  }
}

// ================= HALAMAN UTAMA =================
class InputProfilePage extends StatefulWidget {
  const InputProfilePage({super.key});

  @override
  State<InputProfilePage> createState() => _InputProfilePageState();
}

class _InputProfilePageState extends State<InputProfilePage> {
  ProfileData profile = ProfileData(
    nama: "M Akbar Ramadhan",
    ttl: "Jambi, 19 Oktober 2005",
    gender: "Laki-laki",
    alamat: "Pondok Jaya, Tangerang",
    agama: "Islam",
    pendidikan: "S1 Teknik Informatika",
    phone: "083196390884",
    email: "akbar@email.com",
  );

  Widget buildProfileCard(IconData icon, String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.redAccent.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.redAccent.withOpacity(0.15),
            child: Icon(icon, color: Colors.redAccent),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black,
              Color(0xFF1A0000),
              Color(0xFF3B0000),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Profil Mahasiswa",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        buildProfileCard(
                            Icons.person, "Nama Lengkap", profile.nama),
                        buildProfileCard(
                            Icons.cake, "Tempat/Tgl Lahir", profile.ttl),
                        buildProfileCard(
                            Icons.wc, "Jenis Kelamin", profile.gender),
                        buildProfileCard(
                            Icons.home, "Alamat", profile.alamat),
                        buildProfileCard(
                            Icons.favorite, "Agama", profile.agama),
                        buildProfileCard(Icons.school, "Pendidikan",
                            profile.pendidikan),
                        buildProfileCard(
                            Icons.phone, "No. HP/WA", profile.phone),
                        buildProfileCard(
                            Icons.email, "Email", profile.email),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                    ),
                    onPressed: () async {
                      final updatedProfile = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              ProfileDetailPage(profile: profile),
                        ),
                      );

                      if (updatedProfile != null) {
                        setState(() {
                          profile = updatedProfile;
                        });
                      }
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Colors.redAccent,
                            Color(0xFF8B0000),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Center(
                        child: Text(
                          "Lihat Profil",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ================= HALAMAN DETAIL =================
class ProfileDetailPage extends StatelessWidget {
  final ProfileData profile;

  const ProfileDetailPage({super.key, required this.profile});

  Widget buildDetailCard(IconData icon, String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.redAccent.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.redAccent.withOpacity(0.15),
            child: Icon(icon, color: Colors.redAccent),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black,
              Color(0xFF1A0000),
              Color(0xFF3B0000),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      "Profil Saya",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                const CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.white24,
                  child: Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 16),

                Text(
                  profile.nama,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        buildDetailCard(
                            Icons.cake, "Tempat/Tgl Lahir", profile.ttl),
                        buildDetailCard(
                            Icons.wc, "Jenis Kelamin", profile.gender),
                        buildDetailCard(
                            Icons.home, "Alamat", profile.alamat),
                        buildDetailCard(
                            Icons.favorite, "Agama", profile.agama),
                        buildDetailCard(Icons.school, "Pendidikan",
                            profile.pendidikan),
                        buildDetailCard(
                            Icons.phone, "No. HP/WA", profile.phone),
                        buildDetailCard(
                            Icons.email, "Email", profile.email),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                    ),
                    onPressed: () async {
                      final updatedProfile = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              EditProfilePage(profile: profile),
                        ),
                      );

                      if (updatedProfile != null) {
                        Navigator.pop(context, updatedProfile);
                      }
                    },
                    child: const Text(
                      "Edit Profile",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ================= HALAMAN EDIT =================
class EditProfilePage extends StatefulWidget {
  final ProfileData profile;

  const EditProfilePage({super.key, required this.profile});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController nama;
  late TextEditingController ttl;
  late TextEditingController gender;
  late TextEditingController alamat;
  late TextEditingController agama;
  late TextEditingController pendidikan;
  late TextEditingController phone;
  late TextEditingController email;

  @override
  void initState() {
    super.initState();
    nama = TextEditingController(text: widget.profile.nama);
    ttl = TextEditingController(text: widget.profile.ttl);
    gender = TextEditingController(text: widget.profile.gender);
    alamat = TextEditingController(text: widget.profile.alamat);
    agama = TextEditingController(text: widget.profile.agama);
    pendidikan = TextEditingController(text: widget.profile.pendidikan);
    phone = TextEditingController(text: widget.profile.phone);
    email = TextEditingController(text: widget.profile.email);
  }

  Widget buildField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.redAccent),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.redAccent),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Edit Profile"),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            buildField("Nama Lengkap", nama),
            buildField("Tempat/Tgl Lahir", ttl),
            buildField("Jenis Kelamin", gender),
            buildField("Alamat", alamat),
            buildField("Agama", agama),
            buildField("Pendidikan", pendidikan),
            buildField("No. HP/WA", phone),
            buildField("Email", email),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                ),
                onPressed: () {
                  Navigator.pop(
                    context,
                    ProfileData(
                      nama: nama.text,
                      ttl: ttl.text,
                      gender: gender.text,
                      alamat: alamat.text,
                      agama: agama.text,
                      pendidikan: pendidikan.text,
                      phone: phone.text,
                      email: email.text,
                    ),
                  );
                },
                child: const Text(
                  "Simpan Perubahan",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../services/review_service.dart';
import '../models/review.dart';

class ReviewFormPage extends StatefulWidget {
  final Review? review;

  const ReviewFormPage({super.key, this.review});

  @override
  State<ReviewFormPage> createState() => _ReviewFormPageState();
}

class _ReviewFormPageState extends State<ReviewFormPage> {
  final titleController = TextEditingController();
  final ratingController = TextEditingController();
  final reviewController = TextEditingController();
  
  final service = ReviewService();
  bool isLoading = false;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    if (widget.review != null) {
      titleController.text = widget.review!.title;
      ratingController.text = widget.review!.rating.toString();
      reviewController.text = widget.review!.review;
    }
  }

  Future<void> save() async {
    // Validasi input
    if (titleController.text.isEmpty) {
      setState(() => errorMessage = 'Judul film harus diisi');
      return;
    }

    if (ratingController.text.isEmpty) {
      setState(() => errorMessage = 'Rating harus diisi');
      return;
    }

    int? rating = int.tryParse(ratingController.text);
    if (rating == null || rating < 1 || rating > 10) {
      setState(() => errorMessage = 'Rating harus angka 1-10');
      return;
    }

    if (reviewController.text.isEmpty) {
      setState(() => errorMessage = 'Review harus diisi');
      return;
    }

    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      if (widget.review == null) {
        // Create
        await service.addReview(
          titleController.text.trim(),
          rating,
          reviewController.text.trim(),
        );
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Review berhasil ditambahkan')),
          );
        }
      } else {
        // Update
        await service.updateReview(
          widget.review!.id,
          titleController.text.trim(),
          rating,
          reviewController.text.trim(),
        );
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Review berhasil diperbarui')),
          );
        }
      }

      if (mounted) {
        Navigator.pop(context);
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Gagal menyimpan: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.review == null ? "Tambah Review" : "Edit Review"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (errorMessage != null)
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.red.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),

              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: "Judul Film",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.movie),
                ),
              ),
              const SizedBox(height: 16),

              TextField(
                controller: ratingController,
                decoration: const InputDecoration(
                  labelText: "Rating (1-10)",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.star),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),

              TextField(
                controller: reviewController,
                decoration: const InputDecoration(
                  labelText: "Review",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.comment),
                  alignLabelWithHint: true,
                ),
                maxLines: 5,
              ),
              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: isLoading ? null : save,
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : const Text("Simpan", style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    ratingController.dispose();
    reviewController.dispose();
    super.dispose();
  }
}
import 'package:flutter/material.dart';

class ImageViewer extends StatefulWidget {
  const ImageViewer({
    super.key,
    required this.initialIndex,
    required this.images,
  });

  final int initialIndex;
  final List<String> images;

  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToPrevious() {
    if (_pageController.page! > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToNext() {
    if (_pageController.page! < widget.images.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(height: 16),
          Expanded(
            child: Center(
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _pageController,
                    itemCount: widget.images.length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.asset(
                          widget.images[index],
                          fit: BoxFit.contain,
                        ),
                      );
                    },
                  ),
                  Positioned(
                    left: 16,
                    top: MediaQuery.of(context).size.height * 0.45,
                    child: IconButton(
                      onPressed: _goToPrevious,
                      icon:
                          const Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                  ),
                  Positioned(
                    right: 16,
                    top: MediaQuery.of(context).size.height * 0.45,
                    child: IconButton(
                      onPressed: _goToNext,
                      icon: const Icon(Icons.arrow_forward_ios,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

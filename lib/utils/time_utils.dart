String timeAgo(int d) {
  if (d < 60) return "${d}s";
  if (d < 3600) return "${(d / 60).floor()}m";
  return "${(d / 3600).floor()}h";
}

class BaseEntity<T> {
  final int count;
  final String next;
  final String previous;
  final List<T> results;

  BaseEntity({required this.count, required this.next, required this.previous, required this.results});
}
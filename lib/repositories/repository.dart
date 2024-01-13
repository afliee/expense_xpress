abstract class Repository<T, ID> {
  Future<List<T>> getAll();
  Future<T> get(ID id);
  Future<T> create(T item);
  Future<T> update(T item);
  Future<T> delete(ID id);
}
part of 'base_repo.dart';

abstract class IRepository<T> {
  Future<List<T>> getList();
  Future<T> getOne(int id);
  Future<void> remove(int id);
  Future<void> update(int id);
  Future<void> insert(T item);
}

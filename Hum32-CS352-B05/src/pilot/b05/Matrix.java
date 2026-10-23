package pilot.b05;
import java.util.List;

public interface Matrix<T> {
    int rows();
    int cols();
    List<String> getRowIds();
    List<String> getColumnIds();
    T get(int row, int col);
}
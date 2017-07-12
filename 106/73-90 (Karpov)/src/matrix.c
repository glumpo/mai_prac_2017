#include <matrix.h>

typedef double value_T;
struct _matrix_T {
    int n, m;
    value_T *body;
}
typedef struct _matrix_T *matrix_T;

bool set_coefficient(matrix_T mat,
                     row_T row,
                     column_T col,
                     value_T val) {
    int mat_i = TO_COEFFICIENT(row, col);
    if (mat_i > mat->max_i) {
        // Exception Handler...
        return false;
    }
    mat->body[mat_i] = val;
    return true;
}

value_T* last_row(matrix_T mat) {
    size_t m = mat->m;
    size_t n = mat->n;
    return mat->body + (n-1)*m;
}

value_T* last_col(matrix_T mat) {
    size_t m = mat->m;
    size_t n = mat->n;
    return mat->body + m;
}

value_T* next_col(matrix_T mat, value_T *cur_col) {
    return cur_col + mat->m;
}

value_T* next_row(matrix_T mat, value_T *cur_row) {
    return cur_row + mat->n;
}



// -------------------------------



typedef double value_T;
struct _matrix_T {
    int n, m;
    value_T *body;
}
typedef struct _matrix_T *matrix_T;

bool set_coefficient(matrix_T mat,
                     row_T row,
                     column_T col,
                     value_T val) {
    int mat_i = TO_COEFFICIENT(row, col);
    if (mat_i > mat->max_i) {
        // Exception Handler...
        return false;
    }
    mat->body[mat_i] = val;
    return true;
}

value_T* last_row(matrix_T mat) {
    size_t m = mat->m;
    size_t n = mat->n;
    return mat->body + (n-1)*m;
}

value_T* last_col(matrix_T mat) {
    size_t m = mat->m;
    size_t n = mat->n;
    return mat->body + m;
}

value_T* next_col(matrix_T mat, value_T *cur_col) {
    return cur_col + mat->m;
}

value_T* next_row(matrix_T mat, value_T *cur_row) {
    return cur_row + mat->n;
}

bool put(matrix_T mat, size_t row, size_t col, value_T val) {
    int mat_i = TO_COEFFICIENT(row, col);
    if (mat_i > mat->max_i) {
        // ERROR HANDLER
        return false;
    }
    mat->body[mat_i] = val;
    return true;
}

value_T get(matrix_T mat, size_t row, size_t col) {
    int mat_i = TO_COEFFICIENT(row, col);
    if (mat_i > mat->max_i) {
        // ERROR HANDLER
        return mat->body[0];
    }
    return mat->body[mat_i];
}




pub fn addone(v: usize) -> usize {
    v + 1
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_works() {
        let result = addone(3);
        assert_eq!(result, 4);
    }
}

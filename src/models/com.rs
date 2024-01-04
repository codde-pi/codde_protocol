pub trait Com {
    fn connect(&self);

    fn disconnect(&self);

    fn on(&self);

    fn send(&self);

    fn receive(&self);
}

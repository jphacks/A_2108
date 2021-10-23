package domain

type Address struct {
	ID         int
	Area       int // 大まかな地域，四国や東北等
	Prefecture int
	City       int
	Name       string // 名前
}
package controller

type Controller struct {
	UserRepository  UserRepository
	PlanRepository  PlanRepository
	ImageRepository ImageRepository
}

func NewController() *Controller {
	return &Controller{}
}

func NewControllerWithYesmanRepository() *Controller {
	return &Controller{
		UserRepository:  &yesmanUserRepository{},
		PlanRepository:  &yesmanPlanRepository{},
		ImageRepository: &yesmanImageRepository{},
	}
}

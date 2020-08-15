package api

import (
	"context"
	algo "github.com/k2rth1k/code_notes/pkg/proto/algorithms"
	"log"
)

func(s *Server) HelloWorld(ctx context.Context,req *algo.EmptyMessage) (*algo.EmptyMessage,error){
	log.Println("[called FindMinimumNumber rpc]")
	return &algo.EmptyMessage{},nil
}
